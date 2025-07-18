# Really basic Locust copy of the SampleAppParam.jmx JMeter file
# 
from locust import HttpUser, task, between

class JMeterEquivalentUser(HttpUser):
    wait_time = between(1, 5)  # Simulates user think time between tasks

    @task(1)
    def get_from_lasttimestamp(self):
        self.client.get("/lasttimestamp")

    @task(1)
    def post_to_add(self):
        self.client.post("/add", data="1")

    @task(1)
    def get_all(self):
        self.client.get("/get")
