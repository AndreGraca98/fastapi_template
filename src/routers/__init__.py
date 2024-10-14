from fastapi import APIRouter

from ._tags import TAGS_METADATA  # noqa: F401

__all__ = ["TAGS_METADATA", "ROUTERS"]

ROUTERS: list[APIRouter] = [
    # Add your routers here
]
"""A list of all the routers for the service"""
