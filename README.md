# take_home_scrape_test

## How to run

### Clone repository
`git clone git@github.com:umarsheikh/ruby_scraper_utility.git`

### build docker image
`sudo docker build -t web-archiver .`

### run container
`sudo docker run -it web-archiver bash`

### now we are inside the application container and we can run our application
`ruby processor.rb https://www.google.com [https://www.bing.com] [https://www.example.com] [...]`

### now we can see that there is a new file (www.google.com.html) and a new directory (www.google.com-files) in our app directory
`ls`

### or we can print metadata
  `ruby processor.rb --metadata https://www.google.com`

