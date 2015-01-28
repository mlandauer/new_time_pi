# Control a physical clock by moving the second hand forward
class Clock
  attr_accessor :development

  def initialize
    if Clock.raspberry_pi?
      @pin1 = PiPiper::Pin.new(:pin => 17, :direction => :out)
      @pin2 = PiPiper::Pin.new(:pin => 27, :direction => :out)
      @pin1.off
      @pin2.off
    end
    @count = 0
  end

  def self.raspberry_pi?
    RUBY_PLATFORM == "arm-linux-eabihf"
  end

  # Move the second hand forward
  def tick
    if Clock.raspberry_pi?
      if @count == 0
        pulse_pin(@pin1)
      else
        pulse_pin(@pin2)
      end
    else
      if @count == 0
        puts "Tick..."
      else
        puts "Tock..."
      end
    end

    @count = @count == 0 ? 1 : 0
  end

  private

  def pulse_pin(pin)
    pin.on
    sleep 0.05
    pin.off
  end
end

if Clock.raspberry_pi?
  require 'pi_piper'
end
