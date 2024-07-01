import os
from os.path import join, dirname
from dotenv import load_dotenv

CURDIR = dirname(__file__)
BASE_DIR = os.path.dirname(CURDIR)

dotenv_path = join(CURDIR, '.env')
load_dotenv(dotenv_path)

environ = os.environ["ENVIRONMENT"]

filename = {
        'UAT': '.env-uat',
        'PRD': '.env-prd'
}

if environ in filename:
    load_dotenv(join(CURDIR,
            filename[environ]
        )
    )
env = dict(os.environ)