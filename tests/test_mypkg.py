import unittest

from mypkg import myfunc

class TestMypkg(unittest.TestCase):
    def test_myfunc(self):
        self.assertEqual(myfunc(), 42)
