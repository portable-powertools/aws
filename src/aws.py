from __future__ import absolute_import
from __future__ import print_function
from __future__ import division
import typing

from abc import (ABCMeta, abstractmethod)
import os
from pathlib2 import Path
import sys
import attr
import sutil
import sutil.fun as f
from sutil.fun import (fn, funcy, functional, iters, X, F, curried, methodcaller, Option, Some, Empty, seq, Seq, Sequence, Stream)

def awstest():
    print('hello aws!')
