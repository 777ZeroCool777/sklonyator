# encoding: utf-8
# Тестовый сценарий для склонятора на базе RSpec

# подключаю RSpec
require 'rspec'

# подключаю склонятор
require_relative 'sklonjator.rb'

describe 'Sklonjator' do

  it 'should do ok for KROKODILOV' do
    expect(Sklonjator.sklonenie(5, 'krokodil', 'krokodila', 'krokodilov')).to eq 'krokodilov'

  end

  # автоматизированный сценарий
  it 'should do ok for KROKODILOV_automated' do
    # для чисел
    [5, 6, 7, 8, 9, 0].each do |number|
      # прогоняю от 1 до 100 с шагом 10
      (0..100).step(10) do |i|
        summa = i + number

        expect("#{summa} #{Sklonjator.sklonenie(summa, 'krokodil', 'krokodila', 'krokodilov')}").to eq "#{summa} krokodilov"
      end
    end
  end

  # простые случаи для КРОКОДИЛ
  it 'should do ok for KROKODIL ' do
    [1, 21, 31, 141].each do |i|
      expect(Sklonjator.sklonenie(i, 'krokodil', 'krokodila', 'krokodilov', true)).to eq "#{i} krokodil"
    end
  end

  # простые случаи для КРОКОДИЛА
  it 'should do ok for KROKODILA ' do
    [2, 3, 4, 22, 33, 144].each do |i|
      expect("#{i} #{Sklonjator.sklonenie(i, 'krokodil', 'krokodila', 'krokodilov')}").to eq "#{i} krokodila"
    end
  end

  # особые случаи для КРОКОДИЛОВ
  it 'should do ok for KROKODILOV ' do
    [10, 11, 12, 13, 14, 111, 312, 1013, 2414].each do |i|
      expect("#{i} #{Sklonjator.sklonenie(i, 'krokodil', 'krokodila', 'krokodilov')}").to eq "#{i} krokodilov"
    end
    end
end