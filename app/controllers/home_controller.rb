class HomeController < ApplicationController
  def top
    field1=Field.find_by(id:1)
    field2=Field.find_by(id:2)
    field3=Field.find_by(id:3)
    field4=Field.find_by(id:4)
    field5=Field.find_by(id:5)
    field6=Field.find_by(id:6)
    field7=Field.find_by(id:7)
    field8=Field.find_by(id:8)
    field9=Field.find_by(id:9)
    field10=Field.find_by(id:10)
    field11=Field.find_by(id:11)
  end
end
