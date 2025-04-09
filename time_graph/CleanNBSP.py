
with open('ExperimentPieChart3.py', 'r', encoding='utf-8') as file:
    content = file.read()

content = content.replace('\u00A0', ' ')

with open('ExperimentPieChart4.py', 'w', encoding='utf-8') as file:
    file.write(content)
