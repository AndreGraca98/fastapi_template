
from fastapi import APIRouter

from src.utils import getLogger

from .helpers import BAR

_log = getLogger(__name__)

router_v1 = APIRouter(prefix="/v1/foo", tags=["Foo"])


@router_v1.get("")
async def get_a_foo():
    _log.debug("Getting a foo")
    return dict(foo=BAR)