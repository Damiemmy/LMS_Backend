from celery import shared_task

@shared_task
def getnumber(num):
    if num == str:
        return f"{num} is a character"
    else:
        return f"{num} is a character"
