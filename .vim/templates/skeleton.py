#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys


def main(*args, **kwargs):
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except Exception:
        import traceback as tb
        print(tb.format_exc(), file=sys.stderr)
        raise SystemExit(1)
