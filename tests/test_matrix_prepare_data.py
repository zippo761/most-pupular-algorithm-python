from xml.etree.ElementPath import prepare_parent
import pytest
from Matrix import init_data, input_digit

@pytest.fixture()
def prepare_data():
    matrix_for_iter = init_data(input_digit())
    return matrix_for_iter


@pytest.fixture()
def prepare_input_type():
    digit = input_digit()
    return digit

def test_lenght(prepare_data):
    assert 5 == len(prepare_data)

def test_type_data(prepare_input_type):
    assert int == type(prepare_input_type)
