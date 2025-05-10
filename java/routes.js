// routes.js
import City from "../Cities/City";
// import Home from './pages/Home';
// import Contact from './pages/Contact';
// import Dashboard from './pages/Dashboard';
// import Settings from './pages/Settings';
// import Profile from './pages/Profile';
import CityGestH from "../Cities/CityGestH";
import Locals from "../Locals/Locals";
import Login from "../Login/Login";
import Signup from "../Login/Signup";
import Meddle from "../Meddle";
import ID_pw_find from "../Login/ID_pw_find";

const routes = [
    {
        path: '/',
        component: Meddle,
        exact: true,  // exact가 true일 경우, 정확히 해당 경로와 일치하는 경우만 렌더링
    },
    {
        path: '/city',
        component: City,
        exact: true,  // exact가 true일 경우, 정확히 해당 경로와 일치하는 경우만 렌더링
    },
    {
        path: '/citygesth',
        component: CityGestH,
    },
    {
        path: '/login',
        component: Login,
    },
    
    {
        path: '/signup',
        component: Signup,
    },

    {
        path: '/locals',
        component: Locals,
    },
    {
        path: '/ID_pw_find',
        component: ID_pw_find,
    },

    // {
    //     path: '/dashboard',
    //     component: Dashboard,
    //     routes: [
    //         {
    //             path: '/dashboard/settings',
    //             component: Settings,
    //         },
    //         {
    //             path: '/dashboard/profile',
    //             component: Profile,
    //         },
    //     ],
    // },
];

export default routes;
