import re

def split_integer_into_digit(text):
    list_of_digits = []
    for x in str(text):
        list_of_digits.append(int(x))
    return   list_of_digits

def add_space_before_bracket(text):
    _remove_all_space = re.sub(r'\s+', '', text)
    _add_space_before_bracket = str(re.sub(r'(?<!\s)\(', r' (', _remove_all_space).strip())
    return _add_space_before_bracket

def remove_all_space_from_string(text):
    return str(re.sub(r'\s+', '', text))

def remove_space_before_bracket(text):
    return str(re.sub(r"(?<!\s)\(", r'(', text).strip())

def remove_punctuation_from_string(text):
    return str(re.sub(r'[^\w\s]', '', text))

def remove_all_non_numberic_char(text):
    return str(re.sub(r'[^0-9]', '', text))

def remove_all_numberic(text):
    return str(re.sub(r'[0-9\(.*?\)\s]', '', text))

def convert_string_to_number(text):
    return str(re.sub(r'[^0-9.*]', '', text))