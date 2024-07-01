import re


def convert_to_dollar(value = 0, exchange_rate = 4100):
    return str(value / exchange_rate)


def convert_to_riel(value = 0, exchange_rate = 4100):
    return str(value * exchange_rate)


def amount_string(amount=0):
    return str(re.sub(r'[^0-9.*]', '', str(amount)))

# def amount_string(amount = 0):
#     return str(re.sub(r'[^0-9.*]', '', amount))


# def to_currency_sstrings(amount = '0'):
#     float_amount = float(amount_string(amount))
#     dollar_amount = "{:.2f}".format(float_amount)
#     riel_amount = format(int(float_amount),",") 
#     return {
#         'usd': f'${dollar_amount}',
#         'khr': f'៛{riel_amount}',
#     }


def to_currency_string(amount=0.00):
    # Convert the amount to a string with only numeric characters and periods
    int_amount = int(amount)
    float_amount = float(amount_string(int_amount))
    # Format the float amount to two decimal places for USD representation
    dollar_amount = "{:.2f}".format(float_amount)
    # Format the integer part of the float amount with comma separators for KHR representation
    riel_amount = format(int(float_amount), ",")
    return {
        'usd': f'${dollar_amount}',
        'khr': f'៛{riel_amount}',
    }

# def calculate_total_amount(amount = '0', fee_amount = '0'):
#     float_amount = float(amount_string(amount))
#     float_fee_amount =  float(amount_string(fee_amount))
#     dollar_total_amount = "{:.2f}".format(float(float_amount + float_fee_amount))
#     riel_total_amount = format(int(int(float_amount) + int(float_fee_amount)),",")
#     return {
#         'usd': f'${dollar_total_amount}',
#         'khr':  f'៛{riel_total_amount}'

#     }

def calculate_total_amount(amount='0', fee_amount='0'):
    # Convert amount and fee_amount to integers
    amount_int = int(amount)
    fee_amount_int = int(fee_amount)
    
    # Convert the integer amounts to floats after cleaning them with amount_string function
    float_amount = float(amount_string(amount_int))
    float_fee_amount = float(amount_string(fee_amount_int))
    
    # Calculate the total amount in USD and format it to two decimal places
    dollar_total_amount = "{:.2f}".format(float(float_amount + float_fee_amount))
    
    # Calculate the total amount in KHR and format it with comma separators for thousands
    riel_total_amount = format(int(float_amount + float_fee_amount), ",")
    
    # Return the formatted amounts in a dictionary
    return {
        'usd': f'${dollar_total_amount}',
        'khr': f'៛{riel_total_amount}'
    }

