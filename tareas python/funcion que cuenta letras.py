def count_letter(s, letter):
    s = s.lower()
    count = s.count(letter)
    return count


s = input("Introduce una frase: ")
letter = input("Introduce una letra: ")
print(count_letter(s, letter))
