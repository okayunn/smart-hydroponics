import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

import cv2
import numpy as np

from analysis import create_overlay, measure_mask, segment_plant
from main import read_image, save_png


ROOT = Path(__file__).resolve().parents[1]


class AnalysisTests(unittest.TestCase):
    def test_known_area_and_overlay(self):
        image = np.zeros((100, 200, 3), dtype=np.uint8)
        image[10:60, 20:100] = (0, 255, 0)
        image[70:90, 120:150] = (0, 0, 255)
        mask = segment_plant(image)
        self.assertEqual(measure_mask(mask), {
            "plant_pixels": 4000, "total_pixels": 20000,
            "plant_coverage_percent": 20.0,
        })
        overlay = create_overlay(image, mask)
        np.testing.assert_array_equal(overlay[mask == 0], image[mask == 0])
        self.assertTrue(np.all(np.any(overlay[mask != 0] != image[mask != 0], axis=1)))
        self.assertEqual(int(image[10, 20, 1]), 255)

    def test_empty_and_full_coverage(self):
        for color, expected in [((255, 255, 255), 0.0), ((0, 255, 0), 100.0)]:
            image = np.full((10, 10, 3), color, dtype=np.uint8)
            self.assertEqual(measure_mask(segment_plant(image))["plant_coverage_percent"], expected)

    def test_invalid_array(self):
        with self.assertRaises(ValueError):
            segment_plant(np.zeros((0, 0, 3), dtype=np.uint8))
        with self.assertRaises(ValueError):
            measure_mask(np.zeros((0, 0), dtype=np.uint8))


class CliTests(unittest.TestCase):
    def run_cli(self, *args):
        return subprocess.run([sys.executable, str(ROOT / "main.py"), *map(str, args)],
                              capture_output=True, text=True, cwd=ROOT)

    def test_png_and_jpeg_with_japanese_paths(self):
        with tempfile.TemporaryDirectory(dir=ROOT) as folder:
            base = Path(folder)
            for ext in (".png", ".jpg"):
                with self.subTest(ext=ext):
                    source = base / ("バジル" + ext)
                    image = np.full((40, 60, 3), (0, 255, 0), dtype=np.uint8)
                    ok, encoded = cv2.imencode(ext, image)
                    self.assertTrue(ok)
                    encoded.tofile(source)
                    output = base / ext[1:]
                    result = self.run_cli(source, "--output-dir", output)
                    self.assertEqual(result.returncode, 0, result.stderr)
                    self.assertEqual(json.loads(result.stdout)["plant_pixels"], 2400)
                    saved = json.loads((output / "バジル_metrics.json").read_text())
                    self.assertEqual(saved, json.loads(result.stdout))
                    mask = read_image(output / "バジル_mask.png")
                    self.assertEqual(mask.shape, image.shape)
                    self.assertTrue(np.all(mask == 255))
                    self.assertTrue((output / "バジル_overlay.png").is_file())

    def test_bad_inputs(self):
        with tempfile.TemporaryDirectory(dir=ROOT) as folder:
            base = Path(folder)
            for name, content in [("empty.png", b""), ("broken.jpg", b"invalid"),
                                  ("unsupported.txt", b"text")]:
                path = base / name
                path.write_bytes(content)
                result = self.run_cli(path, "--output-dir", base / "out")
                self.assertEqual(result.returncode, 1)
                self.assertIn("Error:", result.stderr)
            self.assertEqual(self.run_cli(base / "missing.png").returncode, 1)
            self.assertFalse((base / "out").exists())


if __name__ == "__main__":
    unittest.main()
