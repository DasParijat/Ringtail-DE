# this file is to test basic coding/math stuff to see if they fit in the project
# this file is not integral to the project

def main():
    cur_x = 0
    desire_x = 2
    rate = 0.1

    for i in range(100):
        cur_x += (desire_x - cur_x) * rate
        print(cur_x)

if __name__ == '__main__':
    main()