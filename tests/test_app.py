import sys
import os
import unittest

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from app import add, message

class TestApp(unittest.TestCase):

    def test_add(self):
        self.assertEqual(add(2, 3), 5)

    def test_message(self):
        self.assertEqual(message(), "Hello from Python!")

if __name__ == "__main__":
    unittest.main()