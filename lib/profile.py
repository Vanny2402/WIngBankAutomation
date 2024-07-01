import re


# def currency(account):
#     return str(re.sub(
#         r'[0-9\(.*?\)\s]', 
#         '', 
#         account)
#         .lower()
#     )
def currency(account):
    return str(re.sub(
        r'[0-9\(.*?\)\s]','', account).lower()
    )


def currency_s(account):
    currency_long=currency(account)
    if(currency_long =='khr'):
        return  '៛'
    else:
        return  '$'