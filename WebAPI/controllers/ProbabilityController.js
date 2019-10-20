const os = require('os');
var path = require('path');

const Matrix = require('node-matrix');
var exec = require('child_process').exec;
const { Complaint } = require('../models');
const { to, ReE, ReS } = require('../services/util.service');
const models = require('../models');
var OneSignal = require('onesignal-node');
const axios = require('axios');

const GoogleAPIKey = 'AIzaSyA67Wi0ofK9A7nvIiFzShhmbzMFJh-73E0';
const OpenWheatherAPIKey = 'cbf442568e998e2f6bf17c6acd0d649d';

module.exports.getFireProbability = async (req, res) => {
  let latitude;
  let longitude;
  if (req.query.querystring != null) {
    let address = req.query.querystring;
    GeoCodingURL = `https://maps.googleapis.com/maps/api/geocode/json?address=${address}&key=${GoogleAPIKey}`;

    let result = await axios.get(GeoCodingURL);

    latitude = result.data.results[0].geometry.location.lat;
    longitude = result.data.results[0].geometry.location.lng;
  } else {
    latitude = req.query.latitude;
    longitude = req.query.longitude;
  }
  openWheatherAPI = `http://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&apikey=${OpenWheatherAPIKey}&units=metric`;

  let wheatherResult = await axios.get(openWheatherAPI);
  let umidade = wheatherResult.data.main.humidity;
  let temperatura = wheatherResult.data.main.temp;

  // TODO alterar parametros doo machine learning
  probabilidade = 1 / Math.pow(1, -(-0.9242 + 2.0617 * umidade + 1.3033 * temperatura));
  ReS(res, { probability: probabilidade }, 200);
};

module.exports.create = async (req, res) => {
  let err, complaint;
  [err, complaint] = await to(Complaint.create(req.body));
  if (err) return ReE(res, err, 422);
  return ReS(res, { message: 'Complaint criado com sucesso.', complaint }, 201);
};

module.exports.getAll = async (req, res) => {
  [err, complaint] = await to(Complaint.findAll());
  if (err) return ReE(res, err, 500);
  return ReS(res, complaint, 200);
};

module.exports.sendNotification = async (req, res) => {
  var myClient = new OneSignal.Client({
    userAuthKey: 'teste',
    app: { appAuthKey: 'Y2FmYzg2NTMtMDE2My00MjkzLWFiYzYtNTlmMTgzM2QwYWFl', appId: 'e154bfe0-7b0e-4f85-bbf7-da17761f41ce' }
  });

  var firstNotification = new OneSignal.Notification({
    contents: {
      en: 'corre q ta pegando FOGOOOOO'
    },
    included_segments: ['All']
  });

  myClient.sendNotification(firstNotification, function(err, httpResponse, data) {
    if (err) {
      console.log('Something went wrong...');
    } else {
      console.log(data, httpResponse.statusCode);
    }
  });
};
