"""Generate test database files with random strings."""

import sqlite3
import string
import random
from tqdm import tqdm


def _string():
    return ''.join(random.choices(string.ascii_lowercase, k=64))


def _generate(size):
    out = "data/{}.db".format(size)
    con = sqlite3.connect(out)
    cur = con.cursor()
    cur.execute("CREATE TABLE test(x)")
    con.commit()

    for _ in tqdm(range(1000), desc=out):
        rows = [(_string(),) for _ in range(size)]
        cur = con.cursor()
        cur.executemany("INSERT INTO test VALUES(?)", rows)
        con.commit()


if __name__ == '__main__':

    for i in range(20):
        _generate(i * 50 + 50)
