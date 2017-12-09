# Toxography

### Installation

Install Ruby

### Get The Latest Data

`ruby get.rb`

Data will also be written to `out.json`

#### CronTab for Updating Every 10 Minutes

`sudo crontab -e`

Add the Line: `*/10 * * * *  ruby <path to dir>/get.rb`
	
Then you can fetch the latest data from `<path to dir>/out.json`
