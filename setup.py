import json
import pathlib

from setuptools import setup

with (
    pathlib.Path(__file__).resolve().parent / "anki_scaled_lapse" / "manifest.json"
).open() as fp:
    manifest = json.load(fp)


setup(
    name=manifest["package"],
    version=manifest["human_version"],
    packages=["anki_scaled_lapse"],
    package_data={
        "anki_scaled_lapse": ["manifest.json"],
    },
)
