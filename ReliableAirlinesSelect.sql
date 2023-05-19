SELECT TypeCode, TypeDescription, Capacity, FlightRange FROM PlaneType;
SELECT p.SerialNumber, pt.TypeCode, pt.TypeDescription FROM Plane p JOIN PlaneType pt ON p.TypeCode = pt.TypeCode;
SELECT CityCode, CityName, State, AirportDescription FROM City;
SELECT SerialNumber, YearManufactured, DateLastServiced, DateNextServiced FROM Plane;