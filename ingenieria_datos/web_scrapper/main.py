import argparse
import logging
import news_page_objects as news
from common import config

logging.basicConfig(level=logging.INFO)

logger = logging.getLogger(__name__)


def _new_scraper(news_site_uid):
    host = config()["news_sites"][news_site_uid]["url"]

    logging.info("Begginng scraper for {}".format(host))
    homepage = news.HomePage(news_site_uid, host)

    for link in homepage.article_links:
        print(link)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()

    new_site_choices = list(config()["news_sites"].keys())
    parser.add_argument("new_site",
                        help="The news site that you want to scrape",
                        type=str,
                        choices=new_site_choices)

    args = parser.parse_args()
    _new_scraper(args.new_site)
