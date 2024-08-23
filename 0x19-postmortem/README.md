**PostMoterm**

![image](https://github.com/user-attachments/assets/3858c052-665b-44b2-a160-70fb4bbfe4f5)


**Issue Summary**

Duration: 1 hour and 30 minutes, from 14:30 to 16:00 UTC on April 5, 2024.Impact: The core API service experienced a complete outage, affecting 95% of user-facing applications. Users reported errors, slow performance, and inability to access critical features.Root Cause: A configuration change to the load balancer resulted in incorrect traffic distribution, overloading a single API instance and causing it to crash.

**Timeline**
14:30 UTC: Initial monitoring alerts for increased error rates and latency in API responses were triggered.
14:45 UTC: Engineering team on-call received alerts and began investigating the issue.
15:00 UTC: The affected API instance was identified as the primary bottleneck. Attempts to scale the service were unsuccessful due to resource constraints.
15:15 UTC: The decision was made to temporarily disable the load balancer to isolate the issue.
15:30 UTC: Load balancer re-enabled with corrected configuration. Service gradually restored.
16:00 UTC: All systems returned to normal operation.

**Root Cause and Resolution**
The root cause of the outage was an incorrect configuration change to the load balancer. The weight assigned to the affected API instance was unintentionally increased, causing a disproportionate amount of traffic to be directed to it. This overload led to the instance crashing, resulting in a cascading failure as the load balancer continued to send traffic to the unresponsive server.
The issue was resolved by temporarily disabling the load balancer, allowing the system to stabilize. Subsequently, the load balancer configuration was corrected to distribute traffic evenly across all API instances.

**Corrective and Preventative Measures**
To prevent a recurrence, several improvements are necessary:
Enhanced load balancing configuration: Implement stricter validation and testing procedures for load balancer configuration changes. Consider using a configuration management tool to enforce consistency.
Improved monitoring: Expand monitoring to include more granular metrics on API instance performance, such as CPU usage, memory consumption, and response times.
Automated scaling: Implement auto-scaling mechanisms to dynamically adjust the number of API instances based on load conditions.
Circuit breaker pattern: Introduce circuit breaker patterns to protect against cascading failures.
Regular load testing: Conduct load tests to identify performance bottlenecks and capacity limits.
Incident response playbook: Create a detailed incident response playbook outlining roles, responsibilities, and procedures for handling outages.

**Specific tasks include:**
Review and update load balancer configuration management processes.
Implement monitoring for API instance resource utilization.
Configure auto-scaling for API service based on CPU and memory metrics.
Develop and test circuit breaker implementation for API calls.
Conduct load tests every quarter to assess system performance.
Create and distribute incident response playbook to relevant teams.
By addressing these areas, we can significantly reduce the risk of future outages and improve the overall reliability of the API service.


