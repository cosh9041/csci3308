import urllib.request
import json

# Get dictionary of state/capital data. Source: https://github.com/tdlm/fun-with-python/blob/master/states_and_capitals.py
states_caps = {
        'AL':{'state':'Alabama',        'capital':'Montgomery'},
        'AK':{'state':'Alaska',         'capital':'Juneau'},
        'AZ':{'state':'Arizona',        'capital':'Phoenix'},
        'AR':{'state':'Arkansas',       'capital':'Little Rock'},
        'CA':{'state':'California',     'capital':'Sacramento'},
#        'CO':{'state':'Colorado',       'capital':'Denver'},
#        'CT':{'state':'Connecticut',    'capital':'Hartford'},
#        'DE':{'state':'Deleware',       'capital':'Dover'},
#        'FL':{'state':'Florida',        'capital':'Tallahassee'},
#        'GA':{'state':'Georgia',        'capital':'Atlanta'},
#        'HI':{'state':'Hawaii',         'capital':'Honolulu'},
#        'ID':{'state':'Idaho',          'capital':'Boise'},
#        'IL':{'state':'Illinois',       'capital':'Springfield'},
#        'IN':{'state':'Indiana',        'capital':'Indianapolis'},
#        'IA':{'state':'Iowa',           'capital':'Des Moines'},
#        'KS':{'state':'Kansas',         'capital':'Topeka'},
#        'KY':{'state':'Kentucky',       'capital':'Frankfort'},
#        'LA':{'state':'Louisiana',      'capital':'Baton Rouge'},
#        'ME':{'state':'Maine',          'capital':'Augusta'},
#        'MD':{'state':'Maryland',       'capital':'Annapolis'},
#        'MA':{'state':'Massachusetts',  'capital':'Boston'},
#        'MI':{'state':'Michigan',       'capital':'Lansing'},
#        'MN':{'state':'Minnesota',      'capital':'Saint Paul'},
#        'MS':{'state':'Mississippi',    'capital':'Jackson'},
#        'MO':{'state':'Missouri',       'capital':'Jefferson City'},
#        'MT':{'state':'Montana',        'capital':'Helena'},
#        'NE':{'state':'Nebraska',       'capital':'Lincoln'},
#        'NV':{'state':'Nevada',         'capital':'Carson City'},
#        'NH':{'state':'New Hampshire',  'capital':'Concord'},
#        'NJ':{'state':'New Jersey',     'capital':'Trenton'},
#        'NM':{'state':'New Mexico',     'capital':'Santa Fe'},
#        'NY':{'state':'New York',       'capital':'Albany'},
#        'NC':{'state':'North Carolina', 'capital':'Raleigh'},
#        'ND':{'state':'North Dakota',   'capital':'Bismarck'},
#        'OH':{'state':'Ohio',           'capital':'Columbus'},
#        'OK':{'state':'Oklahoma',       'capital':'Oklahoma City'},
#        'OR':{'state':'Oregon',         'capital':'Salem'},
#        'PA':{'state':'Pennsylvania',   'capital':'Harrisburg'},
#        'RI':{'state':'Rhode Island',   'capital':'Providence'},
#        'SC':{'state':'South Carolina', 'capital':'Columbia'},
#        'SD':{'state':'South Dakota',   'capital':'Pierre'},
#        'TN':{'state':'Tennessee',      'capital':'Nashville'},
#        'TX':{'state':'Texas',          'capital':'Austin'},
        'UT':{'state':'Utah',           'capital':'Salt Lake City'},
#        'VT':{'state':'Vermont',        'capital':'Montpelier'},
#        'VA':{'state':'Virginia',       'capital':'Richmond'},
#        'WA':{'state':'Washington',     'capital':'Olympia'},
#        'WV':{'state':'West Virginia',  'capital':'Charleston'},
#        'WI':{'state':'Wisconsin',      'capital':'Madison'},
#        'WY':{'state':'Wyoming',        'capital':'Cheyenne'},
    }

for key in states_caps:
    # Get latitude and longitude from google maps api
    request = "http://maps.googleapis.com/maps/api/geocode/json?address={0}".format(states_caps[key]['capital'].replace(" ", ""))
    response = urllib.request.urlopen(request)
    position_data = json.loads(response.read().decode('utf-8'))
    lat = position_data['results'][0]['geometry']['location']['lat']
    lng = position_data['results'][0]['geometry']['location']['lng']
    lat_string = str(lat)
    lng_string = str(lng)
    
    # Get temperature data from dark sky forecast api
    weather_req = "https://api.forecast.io/forecast/f0f877d232f06de608935e7081837a03/{0},{1}".format(lat_string.strip(),lng_string.strip())
    weather_resp = urllib.request.urlopen(weather_req.strip())
    weather = json.loads(weather_resp.read().decode('utf-8'))
    T = weather['currently']['temperature']

