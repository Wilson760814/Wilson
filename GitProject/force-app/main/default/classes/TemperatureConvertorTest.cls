@isTest
public class TemperatureConvertorTest {
    @isTest static void testWarmTemp()
    {
        Decimal celsius=TemperatureConvertor.FahrenheitToCelsius(70);
        system.assertEquals(21.11, celsius, 'Whats the matter');
    }
    @isTest static void testZeroTemp()
    {
        Decimal celsius=TemperatureConvertor.FahrenheitToCelsius(32);
        system.assertEquals(0, celsius);
    }
}