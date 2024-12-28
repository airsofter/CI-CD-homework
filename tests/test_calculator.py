import unittest
from app.calculator import add, subtract


class TestCalculator(unittest.TestCase):
    def test_add(self):
        self.assertEqual(add(3, 2), 5)
        self.assertEqual(add(-1, 1), 0)
        self.assertEqual(add(0, 0), 0)

    def test_subtract(self):
        self.assertEqual(subtract(3, 2), 1)
        self.assertEqual(subtract(2, 3), -1)
        self.assertEqual(subtract(0, 0), 0)


if __name__ == '__main__':
    unittest.main()
