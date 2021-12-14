const express = require('express');
const {
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
} = require('../controllers/controllers');

const router = express.Router();

router.get('/gemaelde', getGemälde);

router.get('/gemaelde/:id', getSpecificGemälde);

router.delete('/gemaelde/:id', deleteGemälde);

router.post('/gemaelde', postGemälde);

router.patch('/gemaelde/:id', patchGemälde);

router.get('/kuenstler', getKünstler);

router.get('/kuenstler/:id', getSpecificKünstler);

router.delete('/kuenstler/:id', deleteKünstler);

router.post('/kuenstler', postKünstler);

router.patch('/kuenstler/:id', patchKünstler);

module.exports = router;
