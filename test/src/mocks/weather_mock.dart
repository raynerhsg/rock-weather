class WeatherMock {
  static const weatherReponse = {
    "lat": 52.0917,
    "lon": -1.0261,
    "timezone": "Europe/London",
    "timezone_offset": 0,
    "current": {
      "dt": 1710043601,
      "sunrise": 1710052154,
      "sunset": 1710093575,
      "temp": 7.47,
      "feels_like": 6.67,
      "pressure": 993,
      "humidity": 94,
      "dew_point": 6.57,
      "uvi": 0,
      "clouds": 100,
      "visibility": 6079,
      "wind_speed": 1.58,
      "wind_deg": 111,
      "wind_gust": 2.74,
      "weather": [
        {"id": 500, "main": "Rain", "description": "chuva leve", "icon": "10n"}
      ],
      "rain": {"1h": 0.13}
    },
    "daily": [
      {
        "dt": 1710072000,
        "sunrise": 1710052154,
        "sunset": 1710093575,
        "moonrise": 1710053280,
        "moonset": 1710094800,
        "moon_phase": 0,
        "temp": {"day": 7.07, "min": 5.71, "max": 7.47, "night": 5.71, "eve": 6.89, "morn": 7.25},
        "feels_like": {"day": 5.04, "night": 2.79, "eve": 4.7, "morn": 5.53},
        "pressure": 997,
        "humidity": 96,
        "dew_point": 6.54,
        "wind_speed": 5.11,
        "wind_deg": 72,
        "wind_gust": 10.09,
        "weather": [
          {"id": 501, "main": "Rain", "description": "chuva moderada", "icon": "10d"}
        ],
        "clouds": 100,
        "pop": 1,
        "rain": 13.02,
        "uvi": 0.46
      },
      {
        "dt": 1710158400,
        "sunrise": 1710138416,
        "sunset": 1710180080,
        "moonrise": 1710140460,
        "moonset": 1710186780,
        "moon_phase": 0.04,
        "temp": {"day": 7.82, "min": 5.28, "max": 9.11, "night": 5.28, "eve": 7.05, "morn": 5.56},
        "feels_like": {"day": 5.22, "night": 4.43, "eve": 4.98, "morn": 2.39},
        "pressure": 1009,
        "humidity": 86,
        "dew_point": 5.69,
        "wind_speed": 5.01,
        "wind_deg": 8,
        "wind_gust": 8.65,
        "weather": [
          {"id": 804, "main": "Clouds", "description": "nublado", "icon": "04d"}
        ],
        "clouds": 100,
        "pop": 0.8,
        "uvi": 0.71
      },
      {
        "dt": 1710244800,
        "sunrise": 1710224677,
        "sunset": 1710266585,
        "moonrise": 1710227580,
        "moonset": 1710278700,
        "moon_phase": 0.08,
        "temp": {"day": 7.79, "min": 3.86, "max": 10.57, "night": 9.69, "eve": 10.22, "morn": 4.07},
        "feels_like": {"day": 4.43, "night": 7.15, "eve": 9.75, "morn": 1.4},
        "pressure": 1015,
        "humidity": 93,
        "dew_point": 6.73,
        "wind_speed": 6.62,
        "wind_deg": 203,
        "wind_gust": 13.07,
        "weather": [
          {"id": 500, "main": "Rain", "description": "chuva leve", "icon": "10d"}
        ],
        "clouds": 100,
        "pop": 0.81,
        "rain": 1.12,
        "uvi": 0.94
      },
      {
        "dt": 1710331200,
        "sunrise": 1710310938,
        "sunset": 1710353090,
        "moonrise": 1710314880,
        "moonset": 1710370560,
        "moon_phase": 0.12,
        "temp": {"day": 13.38, "min": 7.31, "max": 14.09, "night": 8.83, "eve": 10.74, "morn": 7.31},
        "feels_like": {"day": 12.86, "night": 5.82, "eve": 10.17, "morn": 4.07},
        "pressure": 1016,
        "humidity": 80,
        "dew_point": 9.97,
        "wind_speed": 7.25,
        "wind_deg": 228,
        "wind_gust": 14.09,
        "weather": [
          {"id": 804, "main": "Clouds", "description": "nublado", "icon": "04d"}
        ],
        "clouds": 97,
        "pop": 0,
        "uvi": 2.25
      },
      {
        "dt": 1710417600,
        "sunrise": 1710397199,
        "sunset": 1710439594,
        "moonrise": 1710402300,
        "moonset": 0,
        "moon_phase": 0.16,
        "temp": {"day": 12.15, "min": 7.34, "max": 13.09, "night": 9.9, "eve": 10.22, "morn": 7.57},
        "feels_like": {"day": 11.59, "night": 6.94, "eve": 9.62, "morn": 4.5},
        "pressure": 1012,
        "humidity": 83,
        "dew_point": 9.38,
        "wind_speed": 7.65,
        "wind_deg": 195,
        "wind_gust": 13.87,
        "weather": [
          {"id": 500, "main": "Rain", "description": "chuva leve", "icon": "10d"}
        ],
        "clouds": 100,
        "pop": 0.2,
        "rain": 0.15,
        "uvi": 2.29
      },
      {
        "dt": 1710504000,
        "sunrise": 1710483460,
        "sunset": 1710526098,
        "moonrise": 1710490080,
        "moonset": 1710462360,
        "moon_phase": 0.19,
        "temp": {"day": 11.07, "min": 10.34, "max": 11.99, "night": 10.34, "eve": 10.63, "morn": 10.5},
        "feels_like": {"day": 10.53, "night": 9.68, "eve": 10.07, "morn": 10.14},
        "pressure": 1008,
        "humidity": 88,
        "dew_point": 9.24,
        "wind_speed": 7.57,
        "wind_deg": 236,
        "wind_gust": 14.82,
        "weather": [
          {"id": 500, "main": "Rain", "description": "chuva leve", "icon": "10d"}
        ],
        "clouds": 100,
        "pop": 0.97,
        "rain": 3.33,
        "uvi": 3
      },
      {
        "dt": 1710590400,
        "sunrise": 1710569720,
        "sunset": 1710612602,
        "moonrise": 1710578400,
        "moonset": 1710553800,
        "moon_phase": 0.23,
        "temp": {"day": 11.84, "min": 8.43, "max": 11.84, "night": 10.6, "eve": 11.09, "morn": 8.43},
        "feels_like": {"day": 11.46, "night": 10.25, "eve": 10.79, "morn": 5.89},
        "pressure": 1010,
        "humidity": 91,
        "dew_point": 10.44,
        "wind_speed": 7.17,
        "wind_deg": 191,
        "wind_gust": 13.13,
        "weather": [
          {"id": 500, "main": "Rain", "description": "chuva leve", "icon": "10d"}
        ],
        "clouds": 100,
        "pop": 1,
        "rain": 3.5,
        "uvi": 3
      },
      {
        "dt": 1710676800,
        "sunrise": 1710655980,
        "sunset": 1710699106,
        "moonrise": 1710667560,
        "moonset": 1710644460,
        "moon_phase": 0.25,
        "temp": {"day": 11.28, "min": 8.62, "max": 11.28, "night": 8.62, "eve": 9.26, "morn": 9.53},
        "feels_like": {"day": 10.79, "night": 5.07, "eve": 5.98, "morn": 6.73},
        "pressure": 1008,
        "humidity": 89,
        "dew_point": 9.68,
        "wind_speed": 8.93,
        "wind_deg": 245,
        "wind_gust": 13.47,
        "weather": [
          {"id": 500, "main": "Rain", "description": "chuva leve", "icon": "10d"}
        ],
        "clouds": 98,
        "pop": 0.95,
        "rain": 1.11,
        "uvi": 3
      }
    ]
  };
}
