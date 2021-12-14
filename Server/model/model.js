const db = require('../db');

const getGemälde = async () => {
  const { rows } = await db.query(
    'SELECT * from gemaelde JOIN kuenstler k on k.k_id = gemaelde.k_id  JOIN gemaeldetyp t on t.t_id = gemaelde.t_id ORDER BY gemaelde.t_id',
  );
  return rows;
};

const getSpecificGemälde = async (id) => {
  const { rows } = await db.query('SELECT * from gemaelde WHERE g_id = $1', [id]);
  return rows;
};

const deleteGemälde = async (id) => {
  await db.query('DELETE FROM gemaelde WHERE g_id = $1', [id]);
  return {
    code: 200,
    data: 'Deleted',
  };
};

async function postGemälde(data) {
  const { rows } = await db.query(
    'INSERT INTO gemaelde (titel, jahr, preis, k_id, bild, signiert, t_id, status) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) returning *',
    [data.titel, data.jahr, data.preis, data.k_id, data.bild, data.signiert, data.t_id, data.status],
  );

  return rows;
}

async function patchGemälde(body, id) {
  console.log(id);
  console.log(body);
  let upd = [];
  for (key in body) upd.push(`${key} = '${body[key]}'`);
  const cmd = 'UPDATE gemaelde SET ' + upd.join(', ') + 'WHERE g_id = $1';
  await db.query(cmd, [id]);
  return {
    code: 200,
    data: 'Gemaelde was updated',
  };
}

const getKünstler = async () => {
  const { rows } = await db.query('SELECT * from kuenstler order by k_id');
  return rows;
};

const getSpecificKünstler = async (id) => {
  const { rows } = await db.query('SELECT * from kuenstler WHERE k_id = $1', [id]);
  return rows;
};

const deleteKünstler = async (id) => {
  await db.query('DELETE FROM kuenstler WHERE k_id = $1', [id]);
  return {
    code: 200,
    data: 'Deleted',
  };
};

async function postKünstler(data) {
  const { rows } = await db.query(
    'INSERT INTO kuenstler (vorname, nachname, geburtsjahr, sterbejahr) VALUES ($1, $2, $3, $4) returning *',
    [data.vorname, data.nachname, data.geburtsjahr, data.sterbejahr],
  );
  return rows;
}

async function patchKünstler(body, id) {
  let upd = [];
  for (key in body) upd.push(`${key} = '${body[key]}'`);
  const cmd = 'UPDATE kuenstler SET ' + upd.join(', ') + 'WHERE k_id = $1';
  await db.query(cmd, [id]);
  return {
    code: 200,
    data: 'Kuenstler was updated',
  };
}

module.exports = {
  getGemälde,
  deleteGemälde,
  getSpecificGemälde,
  postGemälde,
  patchGemälde,
  getKünstler,
  getSpecificKünstler,
  deleteKünstler,
  postKünstler,
  patchKünstler,
};
