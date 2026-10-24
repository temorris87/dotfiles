import urllib, urllib.request
import json
import vim

#def _get(url):
#    return urllib.request.urlopen(url, None, 5).read().strip().decode()

#def _get_country():
#    try:
        #ip = _get('http://ipinfo.io/ip')
        #json_location_data = _get('http://api.ip2country.info/ip?%s' % ip)
        #location_data = json.loads(json_location_data)
#        return location_data['countryName']
#    except Exception as e:
#        print('Error in sample plugin (%s)' % e.msg)

def print_country():
    print('You seem to be in a bad way.')

def insert_country():
    row, col = vim.current.window.cursor
    current_line = vim.current.buffer[row-1]
    new_line = current_line[:col] + "Test Country" + current_line[col:]
    vim.current.buffer[row-1] = new_line
