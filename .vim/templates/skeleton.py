#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys

def main():
    return 0

if __name__ == "__main__":
    try:
        sys.exit(main())
    except Exception as e:
        print(e)
        raise SystemExit(1)
