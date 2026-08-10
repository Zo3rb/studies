import pytest

def my_func(x, y, z):
    return x + y + z

def my_exception():
    div = 10 / 0
    return div

class TestClass(object):
    def test_result1(self):
        assert my_func(1, 2, 3) == 5, "Test failed, the result should be 6."
        
    def test_result2(self):
        assert my_func(1, 2, 3) == 6
        
def test_result3():
    with pytest.raises(ZeroDivisionError):
        my_exception()
        
# Test discovery summary:
 
# 1. By default, the collection of tests starts from testpaths (if configured - list of directories in which to search for tests when pytest is run from rootdir) or from the current directory. This is a recursive search - includes sub-directories.
# 2. In these directory(-ies) it looks for test_*.py and *_test.py files.
# 3. Inside these files it looks for functions prefixed with 'test' outside of a class, or functions prefixed with 'test' inside of a class prefixed with 'Test'
 