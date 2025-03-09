ID_PREFIX = 'example'

async def apply(chat, llm):
  await llm.emit_message('Hello, boost!')