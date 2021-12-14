import Vue from 'vue';
import VueRouter from 'vue-router';
import Home from '../views/Home.vue';

Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
  },
  {
    path: '/kontakt',
    name: 'Kontakt',
    component: () => import('../views/Kontakt.vue'),
  },
  {
    path: '/detail/:g_id/',
    name: 'Detail',
    props: true,
    component: () => import('../views/Detail.vue'),
  },
  {
    path: '/insert',
    name: 'Insert',
    component: () => import('../views/Insert.vue'),
  },
];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes,
});

export default router;
