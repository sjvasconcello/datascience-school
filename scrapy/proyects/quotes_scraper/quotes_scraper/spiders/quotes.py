import scrapy

# * Titulo = //h1/a/text()
# * Citas = //span[@class="text" and @itemprop="text"]/text()
# * Top ten tags = //div[contains(@class, "tags-box")]//span[@class="tag-item"]/a/text()
# * Next page button =  //ul[@class="pager"]//li[@class="next"]//a/@href
"""
! Importante
TODO por hacer
* Importart information
? Question
"""

class QuotesSpider(scrapy.Spider):
    name = 'quotes'
    start_urls = [
        'http://quotes.toscrape.com'
    ]
    custom_settings = {
        "FEED_URI": "quotes.json",
        "FEED_FORMAT": "json",
        "CONCURRENT_REQUEST": 24,
        "MEMUSAGE_LIMIT_MB": 2048, # Limite de memnoria ram
        "MEMUSAGE_NOTIFY_MAIL": ["sjvasconcello@gmail.com"], # AVisar si pasa la RAM
        "ROBOTSTXT_OBEY": True, # Obedecer robots.txt,
        "USER_AGENT": "super_scrapter",
        "FEED_EXPORT_ENCODING": "utf-8" # EL encoding
    }

    def parse_only_quotes(self, response, **kwargs):
        if kwargs:
            quotes = kwargs["quotes"]

        quotes.extend(response.xpath(
            '//span[@class="text" and @itemprop="text"]/text()').getall())

        next_page_button_link = response.xpath(
            '//ul[@class="pager"]//li[@class="next"]//a/@href').get()

        if next_page_button_link:
            yield response.follow(next_page_button_link, callback=self.parse_only_quotes, cb_kwargs={"quotes": quotes})
        else:
            yield {
                'quotes': quotes
            }

    def parse(self, response):

        title = response.xpath('//h1/a/text()').get()

        quotes = response.xpath(
            '//span[@class="text" and @itemprop="text"]/text()').getall()
        top_tags = response.xpath(
            '//div[contains(@class, "tags-box")]//span[@class="tag-item"]/a/text()').getall()

        # ! scrapy crawl quotes -a top=3
        top = getattr(self, 'top', None)
        if top:
            top = int(top)
            top_tags = top_tags[:top]

        yield {
            "title": title,
            "top_tags": top_tags
        }

        next_page_button_link = response.xpath(
            '//ul[@class="pager"]//li[@class="next"]//a/@href').get()

        if next_page_button_link:
            yield response.follow(next_page_button_link, callback=self.parse_only_quotes, cb_kwargs={"quotes": quotes})
