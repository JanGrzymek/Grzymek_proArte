const asyncHandler = require('express-async-handler');
const model = require('../model/model');

const getGemälde = asyncHandler(async (req, res) => {
  res.status(200).json(await model.getGemälde());
});

const getSpecificGemälde = asyncHandler(async (req, res) => {
  res.status(200).json(await model.getSpecificGemälde(req.params.id));
});

const deleteGemälde = asyncHandler(async (req, res) => {
  res.status(200).json(await model.deleteGemälde(req.params.id));
});

const postGemälde = asyncHandler(async (req, res) => {
  const { titel, jahr, preis, bild, signiert, t_id, status } = req.body;
  if (!titel || !jahr || !preis || !bild || !signiert || !t_id || !status) {
    res.status(400).send('One or more properties missing: titel, jahr, typ, preis, bild, signiert, status');
    return;
  } else {
    res.status(200).json(await model.postGemälde(req.body));
  }
});

const patchGemälde = asyncHandler(async (req, res) => {
  res.status(200).json(await model.patchGemälde(req.body, req.params.id));
});

const getKünstler = asyncHandler(async (req, res) => {
  res.status(200).json(await model.getKünstler());
});

const getSpecificKünstler = asyncHandler(async (req, res) => {
  res.status(200).json(await model.getSpecificKünstler(req.params.id));
});

const deleteKünstler = asyncHandler(async (req, res) => {
  res.status(200).json(await model.deleteKünstler(req.params.id));
});

const postKünstler = asyncHandler(async (req, res) => {
  const { vorname, nachname, geburtsjahr, sterbejahr } = req.body;
  if (!vorname || !nachname || !geburtsjahr || !sterbejahr) {
    res.status(400).send('One or more properties missing: vorname, nachname, geburtsjahr, sterbejahr');
    return;
  } else {
    res.status(200).json(await model.postKünstler(req.body));
  }
});

const patchKünstler = asyncHandler(async (req, res) => {
  res.status(200).json(await model.patchKünstler(req.body, req.params.id));
});

module.exports = {
  getGemälde,
  getSpecificGemälde,
  deleteGemälde,
  postGemälde,
  patchGemälde,
  getKünstler,
  getSpecificKünstler,
  deleteKünstler,
  postKünstler,
  patchKünstler,
};
