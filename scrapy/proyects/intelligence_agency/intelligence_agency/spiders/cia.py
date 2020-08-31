import scrapy

# XPAth
# Link = //a[starts-with(@href, "collection") and (parent::h3|parent::h2)]/@href
# Body = //div[@class="field-item even"]//p[not(@class)]/text()
# Title = //h1[@class="documentFirstHeading"]/text()

class SpiderCIA(scrapy.Spider):
    name = "cia"
    start_urls = [
        "https://www.cia.gov/library/readingroom/historical-collections"
    ]

    custom_settings = {
        "FEED_URI": "cia.json",
        "FEED_FORMAT": "json",
        "FEED_EXPORT_ENCODING": "utf-8"
    }

    def parse(self, response):
        links_declassofied = response.xpath(
            '//a[starts-with(@href, "collection") and (parent::h3|parent::h2)]/@href').getall()
        
        for link in links_declassofied:
            yield response.follow(link, callback=self.parse_link, cb_kwargs={'url': response.urljoin(link)})

    def parse_link(self, response,**kwargs):
        link = kwargs['url']
        title = response.xpath('//h1[@class="documentFirstHeading"]/text()').get()
        paragraph = response.xpath('//div[@class="field-item even"]//p[not(@class)]/text()').getall()

        yield {
            'url': link,
            'title': title,
            'body': paragraph
        }