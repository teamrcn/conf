import re

def atof(text):
    try:
        retval = float(text)
    except ValueError:
        retval = text
    return retval


def natural_keys(text):
    return [atof(c) for c in re.split(r'[+-]?([0-9]+(?:[.][0-9]*)?|[.][0-9]+)', text)]


def main():
    filename_list = ["abc123.txt", "abc41.txt", "abc11.txt"]
    print(filename_list)
    filename_list.sort(key=natural_keys)
    print(filename_list)


if __name__ == "__main__":
	main()
