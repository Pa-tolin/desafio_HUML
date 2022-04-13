class Appointment
    attr_reader :location, :purpose, :hour, :min
    def initialize(location,purpose,hour,min)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end
end

class MonthlyAppointment < Appointment
    attr_reader :day
    def initialize(location,purpose,hour,min,day)
        super(location,purpose,hour,min)
        @day = day
    end
    def occurs_on?(day)
        day == @day
    end

    def to_s
        "Reunión mensual en #{@location} sobre #{@purpose} el día #{@day} a las #{@hour}:#{@min} hrs."
    end
end

class DailyAppointment < Appointment
    def occurs_on?(hour,min)
        hour == @hour && min == @min
    end

    def to_s
        "Reunión diaria en #{@location} sobre #{@purpose} a las #{@hour}:#{@min} hrs."
    end
end  

class OneTimeAppointment < Appointment
    attr_accessor :day, :month, :year
    def initialize(location,purpose,hour,min,day,month,year)
        super(location,purpose,hour,min)
        @day = day
        @month = month
        @year = year
    end

    def occurs_on?(day,month,year)
        day == @day && month == @month && year == @year
    end

    def to_s
        "Reunión única en #{@location} sobre #{@purpose} el día #{@day}/#{@month}/#{@year} a las #{@hour}:#{@min} hrs."
    end
end

#Polimorfismo
puts OneTimeAppointment.new('Desafio Latam','Trabajo', 14,30, 4, 6, 2019)
puts DailyAppointment.new('Desafio Latam','Educación',8,15)
puts MonthlyAppointment.new('NASA','ALIENS',8,15,23)

#citas
cita3 = OneTimeAppointment.new("Parque O'higgins",'Picnic Empresa',16,45,14,4,2022)
cita2 = DailyAppointment.new('Estación Mapocho', 'Expo Animé',11,30)
cita1 = MonthlyAppointment.new('Disney', 'Mickey',9,45,27)

puts cita3.occurs_on?(22,8,2021)
puts cita2.occurs_on?(10,30)
puts cita1.occurs_on?(27) 