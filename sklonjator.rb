# encoding: utf-8
# метод для склонения русских слов в соответствии с числительным, преобразовано к классу

# XXX/ Этот код необходим только при использовании русских букв на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end # /XXX

class Sklonjator

  # статический метод будет возвращать правильное склонение слова, когда его нужно
  # использовать с числом
  # Например "1 крокодил, 23 крокодила, 12 крокодилов"

  def self.sklonenie(number, krokodil, krokodila, krokodilov, with_number = false)
    if (number == nil || !number.is_a?(Numeric))
      number = 0 # если первый параметр пустой или не число, то по умолчанию 0
    end

    prefix = ""
    prefix = "#{number} " if with_number # число с пробеллом, если wit_number правда


    ostatok = number % 10 # склонение определяется последней цифрой в числе


    ostatok100 = number % 100
    if (ostatok100 >= 11 && ostatok100 <= 14)  # исключение для цифр от 11 до 14
      return "#{prefix}#{krokodilov}"          # родительный патеж (Кого? Чего?)
    end

    if (ostatok == 1)
      return "#{prefix}#{krokodil}" # для 1 - именительный падеж (Кто? Что?)
    end

    if (ostatok >= 2 && ostatok <= 4) # для 2-4 родительный падеж (Кого? Чего?)
      return "#{prefix}#{krokodila}"
    end

    # 5-9 или 0 - родительный падеж множественное число
    if (ostatok > 4 || ostatok == 0)
      return "#{prefix}#{krokodilov}"
    end
  end

  skolko = ARGV[0].to_i # аргумент по умолчанию 0

  # число указывается в аргументе
  # вывожу фразу с правильным падежом, взависимости от числа введенным пользователем
  puts "#{skolko} " +
           sklonenie(skolko, "негритёнок", "негритёнка", "негритят") + " " +
           sklonenie(skolko, "пошел", "пошли", "пошли") +
           " купаться в море!"

end