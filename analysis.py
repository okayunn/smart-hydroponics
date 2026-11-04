"""Pure image analysis; no file I/O or CLI dependencies."""

import cv2
import numpy as np


def segment_plant(image: np.ndarray) -> np.ndarray:
    """Return a uint8 mask (0 or 255) from an 8-bit BGR image.

    OpenCV HSV ranges: H=0..179, S/V=0..255.
    This function can later be replaced by an AI segmentation model.
    """
    if (not isinstance(image, np.ndarray) or image.dtype != np.uint8
            or image.ndim != 3 or image.shape[2] != 3 or image.size == 0):
        raise ValueError("Expected a non-empty uint8 BGR image with 3 channels")
    hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
    return cv2.inRange(hsv, (35, 40, 40), (85, 255, 255))


def measure_mask(mask: np.ndarray) -> dict:
    """Measure projected green coverage, not physical leaf area."""
    if not isinstance(mask, np.ndarray) or mask.ndim != 2 or mask.size == 0:
        raise ValueError("Expected a non-empty 2D mask")
    plant_pixels = int(np.count_nonzero(mask))
    total_pixels = int(mask.size)
    return {
        "plant_pixels": plant_pixels,
        "total_pixels": total_pixels,
        "plant_coverage_percent": round(100 * plant_pixels / total_pixels, 2),
    }


def create_overlay(image: np.ndarray, mask: np.ndarray) -> np.ndarray:
    """Highlight selected pixels in magenta, preserving the background."""
    overlay = image.copy()
    selected = mask != 0
    overlay[selected] = (
        image[selected].astype(np.float32) * 0.5
        + np.array([255, 0, 255], dtype=np.float32) * 0.5
    ).astype(np.uint8)
    return overlay
