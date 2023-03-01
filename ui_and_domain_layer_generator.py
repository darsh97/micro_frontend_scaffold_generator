# Micro Frontend UI and Domain Layer Scaffold Generator

import os
from utils import snake_case, camel_case, snake_case_to_pascal_case

dir = input("Enter directory where you want to save the generated files: ")

where_to_generate_dir = dir if dir.endswith('/') else dir + '/'

mf_name = input("Enter the micro frontend name: ")

mf_snake_case = snake_case(mf_name)
mf_camel_case = camel_case(mf_name)
mf_pascal_case = snake_case_to_pascal_case(mf_snake_case)

ui_and_domain_template_path = 'template/ui_and_domain/'

for root, dirs, files in os.walk(ui_and_domain_template_path):
    os.makedirs(where_to_generate_dir + (root.replace('${mf_snake_case}', mf_snake_case)).replace(ui_and_domain_template_path, ''))
    for _file in files:
        file_path = os.path.join(root, _file)
        new_file_path = where_to_generate_dir + (file_path.replace('${mf_snake_case}', mf_snake_case)).replace(ui_and_domain_template_path, '')
        f = open(new_file_path, 'w')
        with open(file_path, 'r') as auto:
            content = auto.read()
            replaced_content = content.replace('${mf_snake_case}', mf_snake_case)
            replaced_content = replaced_content.replace('${mf_camel_case}', mf_camel_case)
            replaced_content = replaced_content.replace('${mf_pascal_case}', mf_pascal_case)
            f.write(replaced_content)
            f.close()
