import http from 'k6/http';
import { sleep, check } from 'k6';

export const options = {
  stages: [
    { duration: '30s', target: 50 },
    { duration: '1m', target: 500 },
    { duration: '30s', target: 1000 },
    { duration: '30s', target: 0 }
  ],
  thresholds: {
    http_req_failed: ['rate<0.05'],
    http_req_duration: ['p(95)<1000']
  }
};

export default function () {
  const response = http.get('http://10.0.100.25:8080/');
  //const response = http.get('http://nginx:80/');

  check(response, {
    'status is 200': (r) => r.status === 200
  });

  sleep(1);
}