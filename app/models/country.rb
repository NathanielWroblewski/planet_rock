class Country < ActiveRecord::Base
  validates :country, presence: true
  validates :artist, presence: true
  validates :url, presence: true
  validates :url, uniqueness: true
  validate :real_country

  COUNTRIES = [
    'Afghanistan', 'Albania', 'Algeri', 'Angola', 'Antarctica', 'Argentina',
    'Armenia', 'Australia', 'Austria', 'Azerbaijan', 'Bangladesh', 'Belarus',
    'Belgium', 'Belize', 'Benin', 'Bhutan', 'Bolivia', 'Bosnia and Herzegovina',
    'Botswana', 'Brazil', 'Brunei', 'Bulgaria', 'Burkina Faso', 'Burundi',
    'Cambodia', 'Cameroon', 'Canada', 'Central African Republic', 'Chad',
    'China', 'Colombia', 'Costa Rica', 'Croatia', 'Cuba', 'Cyprus',
    'Czech Republic', 'Democratic Republic of the Congo', 'Denmark', 'Djibouti',
    'Dominican Republic', 'East Timor', 'Ecuador',
    'Egypt', 'El Salvador', 'Equatorial Guinea', 'Eritrea', 'Estonia',
    'Ethiopia', 'Falkland Islands', 'Fiji', 'Finland', 'France',
    'French Southern and Antarctic Lands', 'Gabon', 'Gambia', 'Georgia',
    'Germany', 'Ghana', 'Greece', 'Greenland', 'Guatemala', 'Guinea',
    'Guinea Bissau', 'Guyana', 'Haiti', 'Honduras', 'Hungary', 'Iceland',
    'India', 'Indonesia', 'Iran', 'Iraq', 'Ireland', 'Israel', 'Italy',
    'Ivory Coast', 'Jamaica', 'Japan', 'Jordan', 'Kazakhstan', 'Kenya',
    'Kosovo', 'Kuwait', 'Kyrgyzstan', 'Laos', 'Latvia', 'Lebanon', 'Lesotho',
    'Liberia', 'Libya', 'Lithuania', 'Luxembourg', 'Macedonia', 'Madagascar',
    'Malawi', 'Malaysia', 'Mali', 'Mauritania', 'Mexico', 'Moldova', 'Mongolia',
    'Montenegro', 'Morocco', 'Mozambique', 'Myanmar', 'Namibia', 'Nepal',
    'Netherlands', 'New Zealand', 'Nicaragua', 'Niger', 'Nigeria',
    'North Korea', 'Northern Cyprus', 'Norway', 'Oman', 'Pakistan', 'Panama',
    'Papua New Guinea', 'Paraguay', 'Peru', 'Philippines', 'Poland', 'Portugal',
    'Puerto Rico', 'Qatar', 'Republic of Serbia', 'Republic of the Congo',
    'Romania', 'Russia', 'Rwanda', 'Saudi Arabia', 'Senegal', 'Sierra Leone',
    'Slovakia', 'Slovenia', 'Solomon Islands', 'Somalia', 'Somaliland',
    'South Africa', 'South Korea', 'South Sudan', 'Spain', 'Sudan', 'Suriname',
    'Swaziland', 'Sweden', 'Switzerland', 'Syria', 'Tajikistan', 'Thailand',
    'The Bahamas', 'Togo', 'Trinidad and Tobago', 'Tunisia', 'Turkmenistan',
    'United Arab Emirates', 'United Kingdom', 'United States of America',
    'Uruguay', 'Uzbekistan', 'Vanuatu', 'Venezuela', 'Vietnam', 'West Bank',
    'Western Sahara', 'Yemen', 'Zambia', 'Zimbabwe'
  ]

  def real_country
    COUNTRIES.include?(country)
  end
end
