import pandas as pd
from urllib.parse import urlparse
import argparse
import logging
import hashlib
import nltk
from nltk.corpus import stopwords
logging.basicConfig(level=logging.INFO)


logger = logging.getLogger(__name__)

stop_words = set(stopwords.words("spanish"))


def main(filename):
    logger.info("Starting cleaning process")

    df = _read_data(filename)
    newspaper_uid = _extract_newspaper_uid(filename)
    df = _add_newspaper_uid_column(df, newspaper_uid)
    df = _extract_host(df)
    df = _generate_uid_for_rows(df)
    df = _remove_new_lines_from_body(df)
    df = _tokenize_column(df)
    return df


def _read_data(filename):
    logger.info("Reading file {}".format(filename))
    return pd.read_csv(filename)


def _extract_newspaper_uid(filename):
    logger.info("Extracting newspaper uid")
    newspaper_uid = filename.split("_")[0]

    logger.info("Newspaper uid detected: {}".format(newspaper_uid))
    return newspaper_uid


def _add_newspaper_uid_column(df, newspaper_uid):
    logger.info("Filling newspaper_uid column with {}".format(newspaper_uid))
    df["newspaper_uid"] = newspaper_uid

    return df


def _extract_host(df):
    logger.info("Extracting host from urls")
    df["host"] = df["url"].apply(lambda url: urlparse(url).netloc)

    return df


def _generate_uid_for_rows(df):
    logger.info("Generating uid for each row")
    uids = (df
            .apply(lambda row: hashlib.md5(bytes(row["url"].encode())), axis=1)
            .apply(lambda has_object: has_object.hexdigest())
            )
    df["uid"] = uids

    return df.set_index("uid")


def _remove_new_lines_from_body(df):
    logger.info("Remove new lines from body")

    stripped_body = (df
                     .apply(lambda row: row["body"], axis=1)
                     .apply(lambda body: list(body))
                     .apply(lambda letters: list(map(lambda letter: letter.replace("\n", " "), letters)))
                     .apply(lambda letters: "".join(letters))
                     )
    df["body"] = stripped_body

    return df


def _tokenize_column(df, column_name):
    tokenize = df.dropna().apply(
        lambda row: nltk.word_tokenize(row[column_name]), axis=1)
    .apply(lambda tokens: list(filter(lambda token: token.isalpha(), tokens)))
    .apply(lambda tokens: list(map(lambda token: token.lower(), tokens)))
    .apply(lambda word_list: list(filter(lambda word: word not in stop_words, word_list)))
    .apply(lambda valid_word_list: len(valid_word_list))

    df["n_tokens_title"] = tokenize

    return df


el_rancaguino["n_tokens_title"] = tokenize_column(el_rancaguino, "title")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("filename",
                        help="The path to the dirty data",
                        type=str)

    args = parser.parse_args()
    df = main(args.filename)
    print(df)
