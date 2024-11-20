import pandas as pd

url = "https://en.wikipedia.org/wiki/Home_video_game_console#List_of_home_video_game_consoles"
tables = pd.read_html(url)[3:-3]

for table in tables:
    table.to_csv('consoles.csv', mode='a')



