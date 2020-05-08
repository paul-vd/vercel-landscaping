// Next.js API route support: https://nextjs.org/docs/api-routes/introduction

const DEPLOY_ENV =
  process.env.DEPLOY_ENV || "DEPLOY_ENV env variable not found";

export default (req, res) => {
  res.statusCode = 200;
  res.json({ DEPLOY_ENV });
};
