import http from 'k6/http';
import { sleep } from 'k6';

// Define test configuration options:
// - vus: Number of virtual users (concurrent users) set to 5
// - duration: Total test duration set to 3000 seconds (50 minutes)
export const options = {
  vus: 5,
  duration: '3000s',
};

// Define request parameters object with headers
// - Content-Type: Specifies JSON format for request/response
// - Host: Virtual host name for routing requests
const params = {
    headers: {
      'Content-Type': 'application/json',
      'Host': 'chip.linuxtips.demo'
    },
  };
// Main test function executed for each virtual user
// Makes an HTTP GET request to the system endpoint
// @param {Object} params - Request parameters including headers
// @returns {void}
export default function () {
  http.get('http://linuxtips-ecs-ingress-209539939.us-east-1.elb.amazonaws.com/system', params);
}
