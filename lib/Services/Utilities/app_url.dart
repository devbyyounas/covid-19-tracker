class AppUrl {
  // this is our base url for the api
  static const String baseUrl = 'https://disease.sh/v3/covid-19/';

  // this is our endpoint for the world stats
  static const String worldStatsApi = '${baseUrl}all';
  static const String countriesListApi = '${baseUrl}countries';
}
