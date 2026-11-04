"""Analyze one JPEG/PNG and save metrics and inspection images."""

import argparse
import json
from pathlib import Path
import sys

import cv2
import numpy as np

from analysis import create_overlay, measure_mask, segment_plant


def read_image(path: Path) -> np.ndarray:
    if path.suffix.lower() not in {".jpg", ".jpeg", ".png"}:
        raise ValueError("Input must be a JPEG or PNG file")
    # imdecode/fromfile support Japanese file paths on Windows.
    data = np.fromfile(path, dtype=np.uint8)
    if data.size == 0:
        raise ValueError(f"Image is empty: {path}")
    image = cv2.imdecode(data, cv2.IMREAD_COLOR)
    if image is None:
        raise ValueError(f"Cannot decode image: {path}")
    return image


def save_png(path: Path, image: np.ndarray) -> None:
    success, encoded = cv2.imencode(".png", image)
    if not success:
        raise ValueError(f"Cannot encode image: {path}")
    encoded.tofile(path)


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description="Measure green plant coverage in one JPEG/PNG.")
    parser.add_argument("image", type=Path, help="Input JPEG/PNG image")
    parser.add_argument("--output-dir", type=Path, default=Path("output"),
                        help="Output folder (default: output)")
    args = parser.parse_args(argv)
    try:
        image = read_image(args.image)
        mask = segment_plant(image)
        metrics = measure_mask(mask)
        outputs = {
            "mask": args.output_dir / f"{args.image.stem}_mask.png",
            "overlay": args.output_dir / f"{args.image.stem}_overlay.png",
            "metrics": args.output_dir / f"{args.image.stem}_metrics.json",
        }
        # Prevent accidental replacement of an input named e.g. basil_mask.png.
        if args.image.resolve() in [path.resolve() for path in outputs.values()]:
            raise ValueError("Output would overwrite input; choose another --output-dir")
        args.output_dir.mkdir(parents=True, exist_ok=True)
        save_png(outputs["mask"], mask)
        save_png(outputs["overlay"], create_overlay(image, mask))
        result = json.dumps(metrics, indent=2)
        outputs["metrics"].write_text(result + "\n", encoding="utf-8")
    except (OSError, ValueError, cv2.error) as exc:
        print(f"Error: {exc}", file=sys.stderr)
        return 1
    print(result)
    print(f"Saved results to: {args.output_dir.resolve()}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
